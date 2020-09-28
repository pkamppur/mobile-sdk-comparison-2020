export interface GameDetails {
  name: string;
  id: string;
  thumbnailUrl: string;
  imageUrl: string;
  description: string;
  yearPublished: string;
  categories: Link[];
  mechanisms: Link[];
  designers: Link[];
  artists: Link[];
  expansions: Link[];
  families: Link[];
  implementations: Link[];
  publishers: Link[];
  playersMin: number;
  playersMax: number;
  playersBest: number;
  playingTime: number;
  playingTimeMin: number;
  playingTimeMax: number;
}

export interface Link {
  name: string;
  id: string;
}
