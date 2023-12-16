import { Resolver, Query, Args, Int } from '@nestjs/graphql';
import { PositiveIntPipe } from 'src/pipes';
import { Character } from './entities/character.entity';
import { CharactersService } from './characters.service';

@Resolver(() => Character)
export class CharactersResolver {
  constructor(private readonly charactersService: CharactersService) {}

  @Query(() => [Character], { description: 'Get a list of characters' })
  async characters(
    @Args('skip', { type: () => Int, defaultValue: 0 }, PositiveIntPipe) skip: number,
    @Args('take', { type: () => Int, defaultValue: 10 }, PositiveIntPipe) take: number,
    @Args('name', { nullable: true, description: 'Filter characters by name' })
    name?: string
  ) {
    return this.charactersService.findAll(skip, take, name);
  }

  @Query(() => Character, { nullable: true, description: 'Get a character by ID' })
  async character(
    @Args('id', { type: () => Int, description: 'Character ID' }, PositiveIntPipe) id: number
  ) {
    return this.charactersService.findOne(id);
  }
}
