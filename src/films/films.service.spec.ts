import { Test, TestingModule } from '@nestjs/testing';
import { FilmsService } from './films.service';
import { PrismaService } from '../prisma/prisma.service';

describe('FilmsService', () => {
  let filmsService: FilmsService;

  const mockPrismaService = {
    film: {
      findMany: jest.fn(),
      findUnique: jest.fn()
    }
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        FilmsService,
        {
          provide: PrismaService,
          useValue: mockPrismaService
        }
      ]
    }).compile();

    filmsService = module.get<FilmsService>(FilmsService);
  });

  it('should be defined', () => {
    expect(filmsService).toBeDefined();
  });

  describe('findAll', () => {
    it('should return an array of films', async () => {
      const expectedFilms = [{ id: 1, title: 'Film 1' }];
      mockPrismaService.film.findMany.mockResolvedValue(expectedFilms);

      const result = await filmsService.findAll();

      expect(result).toEqual(expectedFilms);
    });

    it('should return filtered films when title is provided', async () => {
      const expectedFilms = [{ id: 1, title: 'Film 1' }];
      const title = 'Film';
      mockPrismaService.film.findMany.mockResolvedValue(expectedFilms);

      const result = await filmsService.findAll(0, 10, title);

      expect(result).toEqual(expectedFilms);
      expect(mockPrismaService.film.findMany).toHaveBeenCalledWith({
        where: {
          title: {
            contains: title,
            mode: 'insensitive'
          }
        },
        skip: 0,
        take: 10
      });
    });
  });

  describe('findOne', () => {
    it('should return a single film', async () => {
      const expectedFilm = { id: 1, title: 'Film 1' };
      const filmId = 1;
      mockPrismaService.film.findUnique.mockResolvedValue(expectedFilm);

      const result = await filmsService.findOne(filmId);

      expect(result).toEqual(expectedFilm);
      expect(mockPrismaService.film.findUnique).toHaveBeenCalledWith({
        where: { id: filmId }
      });
    });
  });
});
