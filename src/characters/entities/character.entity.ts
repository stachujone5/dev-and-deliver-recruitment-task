import { ObjectType, Field, Int } from '@nestjs/graphql';
import { Character as PrismaCharacter } from '@prisma/client';

@ObjectType()
export class Character implements PrismaCharacter {
  @Field(() => Int)
  id: number;

  @Field()
  name: string;

  @Field()
  birthYear: string;

  @Field()
  eyeColor: string;

  @Field()
  gender: string;

  @Field()
  hairColor: string;

  @Field()
  height: string;

  @Field()
  mass: string;

  @Field()
  skinColor: string;

  @Field({ nullable: true })
  homeworld: string;

  @Field()
  url: string;

  @Field()
  created: string;

  @Field()
  edited: string;

  @Field(() => Int)
  planetId: number;
}
