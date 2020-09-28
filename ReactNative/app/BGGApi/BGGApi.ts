import {Game} from './Game';
import {GameDetails} from './GameDetails';

const baseUrl = 'http://localhost:38651/api';

export namespace BGGApi {
  export const fetchTheHotness = (): Promise<Game[]> => {
    return fetch(`${baseUrl}/the-hotness`)
      .then((response) => {
        return response.json();
      })
      .then((json) => {
        return json.items;
      });
  };

  export const fetchGameDetails = (gameId: string): Promise<GameDetails> => {
    return fetch(`${baseUrl}/games/${gameId}/details`).then((response) => {
      return response.json();
    });
  };
}
