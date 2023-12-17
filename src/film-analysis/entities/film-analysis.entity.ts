import { ObjectType, Field } from '@nestjs/graphql';

@ObjectType()
export class FilmAnalysis {
  @Field(() => [[String, Number]])
  uniqueWordsWithOccurrences: [string, number][];

  @Field(() => [String])
  mostFrequentCharacter: [string, string];
}
