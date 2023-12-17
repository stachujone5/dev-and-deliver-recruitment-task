import { Test, TestingModule } from '@nestjs/testing';
import { FilmAnalysisService } from './film-analysis.service';
import { PrismaService } from '../prisma/prisma.service';

describe('FilmAnalysisService', () => {
  let filmAnalysisService: FilmAnalysisService;

  const mockPrismaService = {
    film: {
      findMany: jest.fn()
    },
    character: {
      findMany: jest.fn()
    }
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        FilmAnalysisService,
        {
          provide: PrismaService,
          useValue: mockPrismaService
        }
      ]
    }).compile();

    filmAnalysisService = module.get<FilmAnalysisService>(FilmAnalysisService);
  });

  it('should be defined', () => {
    expect(filmAnalysisService).toBeDefined();
  });

  describe('analyzeFilms', () => {
    it('should analyze films and return the result', async () => {
      const mockFilms = [
        {
          openingCrawl: 'Sample opening crawl text'
        }
      ];
      const mockCharacters = [
        {
          name: 'Character1'
        }
      ];

      mockPrismaService.film.findMany.mockResolvedValue(mockFilms);
      mockPrismaService.character.findMany.mockResolvedValue(mockCharacters);

      const result = await filmAnalysisService.analyzeFilms();

      expect(result).toBeDefined();
    });
  });
});
