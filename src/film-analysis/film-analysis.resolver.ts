import { Resolver, Query } from '@nestjs/graphql';
import { FilmAnalysisService } from './film-analysis.service';
import { FilmAnalysis } from './entities/film-analysis.entity';

@Resolver('FilmAnalysis')
export class FilmAnalysisResolver {
  constructor(private readonly filmAnalysisService: FilmAnalysisService) {}

  @Query(() => FilmAnalysis)
  async analyzeFilms() {
    return this.filmAnalysisService.analyzeFilms();
  }
}
