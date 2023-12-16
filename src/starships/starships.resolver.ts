import { Resolver, Query, Args, Int } from '@nestjs/graphql';
import { PositiveIntPipe } from 'src/pipes';
import { Starship } from './entities/starship.entity';
import { StarshipsService } from './starships.service';

@Resolver(() => Starship)
export class StarshipsResolver {
  constructor(private readonly starshipService: StarshipsService) {}

  @Query(() => [Starship], { description: 'Get a list of starships' })
  async starships(
    @Args('skip', { type: () => Int, defaultValue: 0 }, PositiveIntPipe) skip: number,
    @Args('take', { type: () => Int, defaultValue: 10 }, PositiveIntPipe) take: number,
    @Args('name', { nullable: true, description: 'Filter starships by name' })
    name?: string
  ) {
    return this.starshipService.findAll(skip, take, name);
  }

  @Query(() => Starship, { nullable: true, description: 'Get a starship by ID' })
  async starship(
    @Args('id', { type: () => Int, description: 'Starship ID' }, PositiveIntPipe) id: number
  ) {
    return this.starshipService.findOne(id);
  }
}
