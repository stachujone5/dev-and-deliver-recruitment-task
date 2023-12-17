import { Module } from '@nestjs/common';
import { FilmAnalysisService } from './film-analysis.service';
import { FilmAnalysisResolver } from './film-analysis.resolver';

@Module({
  providers: [FilmAnalysisService, FilmAnalysisResolver]
})
export class FilmAnalysisModule {}
