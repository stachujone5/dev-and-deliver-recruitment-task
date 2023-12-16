import { Resolver, Query, Args, Int } from '@nestjs/graphql';
import { PositiveIntPipe } from 'src/pipes';
import { SpeciesService } from './species.service';
import { Specie } from './entities/specie.entity';

@Resolver(() => Specie)
export class SpeciesResolver {
  constructor(private readonly speciesService: SpeciesService) {}

  @Query(() => [Specie], { description: 'Get a list of species' })
  async species(
    @Args('skip', { type: () => Int, defaultValue: 0 }, PositiveIntPipe) skip: number,
    @Args('take', { type: () => Int, defaultValue: 10 }, PositiveIntPipe) take: number,
    @Args('name', { nullable: true, description: 'Filter species by name' })
    name?: string
  ) {
    return this.speciesService.findAll(skip, take, name);
  }

  @Query(() => Specie, { nullable: true, description: 'Get a specie by ID' })
  async specie(
    @Args('id', { type: () => Int, description: 'Specie ID' }, PositiveIntPipe) id: number
  ) {
    return this.speciesService.findOne(id);
  }
}
