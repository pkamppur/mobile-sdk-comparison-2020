import express = require('express');
import enforce = require('express-sslify');
import axiosAll = require('axios');
import xml2js = require('xml2js');
import compression = require('compression');
import entities = require('html-entities');

const axios = axiosAll.default;

const PORT = process.env.PORT || 38651;
const DEBUG = process.env.DEBUG || false;

const app = express();

console.log(`Starting (DEBUG ${DEBUG})`);

if (!DEBUG) {
  app.use(enforce.HTTPS({ trustProtoHeader: true }));
}

app.use(compression());

const bggBaseUrl = 'https://www.boardgamegeek.com/xmlapi2';

app.get('/api/the-hotness', async (req, res, next) => {
  try {
    const hotnessResult = await axios.get(`${bggBaseUrl}/hot?type=boardgame`);
    const json = await xml2js.parseStringPromise(hotnessResult.data);
    const result = {
      items: json.items.item.map(game => {
        return {
          name: game.name[0].$.value,
          id: game.$.id,
          rank: Number(game.$.rank),
          thumbnailUrl: game.thumbnail[0].$.value,
          yearPublished: game.yearpublished?.[0]?.$?.value || '',
        };
      }),
    };
    res.set('Cache-Control', hotnessResult.headers['cache-control']);
    res.json(result);
  } catch (err) {
    next(err);
  }
});

app.get('/api/games/:id/details', async (req, res, next) => {
  try {
    const detailsResult = await axios.get(`${bggBaseUrl}/thing`, {
      params: {
        id: req.params.id,
        type: 'boardgame',
        versions: 1,
        videos: 1,
        stats: 1,
        historical: 1,
        marketplace: 1,
        comments: 1,
        ratingcomments: 1,
      },
    });

    const json = await xml2js.parseStringPromise(detailsResult.data);
    const game = json.items.item[0];

    const playersCommunityBest: { numPlayers: number; votes: number } = game.poll
      .filter(poll => poll.$.name === 'suggested_numplayers')?.[0]
      .results.map(x => {
        return {
          numPlayers: Number(x.$.numplayers),
          votes: Number(x.result.filter(votes => votes.$.value === 'Best')?.[0].$.numvotes),
        };
      })
      .sort((one, two) => (one.votes > two.votes ? -1 : 1))?.[0].numPlayers;

    const result = {
      name: game.name[0].$.value,
      id: game.$.id,
      thumbnailUrl: game.thumbnail[0],
      imageUrl: game.image[0],
      yearPublished: game.yearpublished?.[0]?.$?.value || '',
      description: entities.decode(game.description[0]),
      categories: extractLinks(game.link, 'boardgamecategory'),
      mechanisms: extractLinks(game.link, 'boardgamemechanic'),
      designers: extractLinks(game.link, 'boardgamedesigner'),
      artists: extractLinks(game.link, 'boardgameartist'),
      expansions: extractLinks(game.link, 'boardgameexpansion'),
      families: extractLinks(game.link, 'boardgamefamily'),
      implementations: extractLinks(game.link, 'boardgameimplementation'),
      publishers: extractLinks(game.link, 'boardgamepublisher'),
      playingTime: Number(game.playingtime[0].$.value),
      playingTimeMin: Number(game.minplaytime[0].$.value),
      playingTimeMax: Number(game.maxplaytime[0].$.value),
      playersMin: Number(game.minplayers[0].$.value),
      playersMax: Number(game.maxplayers[0].$.value),
      playersBest: playersCommunityBest || 0,
    };
    res.json(result);
  } catch (err) {
    next(err);
  }
});

function extractLinks(links: any[], type: string) {
  return links
    .filter(link => link.$.type === type)
    .map(link => {
      return { name: link.$.value, id: link.$.id };
    });
}

app.listen(PORT, () => console.log(`Listening on ${PORT}`));
