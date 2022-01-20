import faker from 'faker';

function randomArray<T>(length: number, mapper: (idx: number) => T): T[] {
  return Array.from({ length }, (_, idx) => ++idx).map(mapper);
}

function randomInt(max: number) {
  return Math.floor(Math.random() * max);
}

export function randomHotness() {
  const newHotness = {
    items: randomArray(10, item => ({
      id: 1000 + item,
      name: faker.commerce.productName(),
      rank: item,
      thumbnailUrl: faker.image.imageUrl() + '/' + faker.datatype.uuid() + '.png',
      yearPublished: 2020 - Math.floor(item / 2),
    })),
  };

  console.log(JSON.stringify(newHotness));

  return newHotness;
}

export function randomGameDetails() {
  const gameDetails = {
    artists: randomArray(1 + randomInt(5), index => ({
      id: '' + (2000 + index),
      name: faker.name.findName(),
    })),
    categories: randomArray(3 + randomInt(5), index => ({
      id: '' + (3000 + index),
      name: faker.commerce.department(),
    })),
    description: faker.lorem.paragraphs(),
    designers: randomArray(1 + randomInt(5), index => ({
      id: '' + (4000 + index),
      name: faker.name.findName(),
    })),
    expansions: [],
    families: [],
    id: '' + faker.datatype.number(),
    imageUrl: faker.image.imageUrl() + '/' + faker.datatype.uuid() + '-full.png',
    implementations: [],
    mechanisms: randomArray(2 + randomInt(10), index => ({
      id: '' + (5000 + index),
      name: faker.commerce.department(),
    })),
    name: faker.commerce.productName(),
    playersBest: 2,
    playersMax: 4,
    playersMin: 1,
    playingTime: 150,
    playingTimeMax: 150,
    playingTimeMin: 90,
    publishers: randomArray(1 + randomInt(10), index => ({
      id: '' + (6000 + index),
      name: faker.company.companyName(),
    })),
    thumbnailUrl: faker.image.imageUrl() + '/' + faker.datatype.uuid() + '.png',
    yearPublished: 2020 - randomInt(10),
  };
  console.log(JSON.stringify(gameDetails));

  return gameDetails;
}
