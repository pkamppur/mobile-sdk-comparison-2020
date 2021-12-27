import { Game } from './Game';
import { GameDetails } from './GameDetails';

const baseUrl = 'http://localhost:38651/api';

export namespace BGGApi {
  export const fetchTheHotness = async (): Promise<Game[]> => {
    const response = await fetch(`${baseUrl}/the-hotness`);
    const json = await response.json();
    return json.items;
  };

  export const fetchGameDetails = async (
    gameId: string,
  ): Promise<GameDetails> => {
    const response = await fetch(`${baseUrl}/games/${gameId}/details`);
    const json = await response.json();
    return json;
  };
}
