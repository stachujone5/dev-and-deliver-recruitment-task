import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Planet as PrismaPlanet } from '@prisma/client';

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
}
