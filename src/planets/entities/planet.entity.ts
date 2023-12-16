import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Planet as PrismaPlanet } from '@prisma/client';
import { Character } from 'src/characters/entities/character.entity';
import { Film } from 'src/films/entities/film.entity';
import { Specie } from 'src/species/entities/specie.entity';

@ObjectType()
export class Planet implements PrismaPlanet {
  @Field(() => Int)
  id: number;

  @Field()
  name: string;

  @Field()
  diameter: string;

  @Field()
  rotationPeriod: string;

  @Field()
  orbitalPeriod: string;

  @Field()
  gravity: string;

  @Field()
  population: string;

  @Field()
  climate: string;

  @Field()
  terrain: string;

  @Field()
  surfaceWater: string;

  @Field()
  url: string;

  @Field()
  created: string;

  @Field()
  edited: string;

  @Field(() => [Character], { nullable: 'itemsAndList' })
  residents: Character[];

  @Field(() => [Film], { nullable: 'itemsAndList' })
  films: Film[];

  @Field(() => [Specie], { nullable: 'itemsAndList' })
  species: Specie[];
}
