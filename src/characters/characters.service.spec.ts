import { Test, TestingModule } from '@nestjs/testing';
import { CharactersService } from './characters.service';
import { PrismaService } from '../prisma/prisma.service';

describe('CharactersService', () => {
  let charactersService: CharactersService;

  const mockPrismaService = {
    character: {
      findMany: jest.fn(),
      findUnique: jest.fn()
    }
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        CharactersService,
        {
          provide: PrismaService,
          useValue: mockPrismaService
        }
      ]
    }).compile();

    charactersService = module.get<CharactersService>(CharactersService);
  });

  it('should be defined', () => {
    expect(charactersService).toBeDefined();
  });

  describe('findAll', () => {
    it('should return an array of characters', async () => {
      const expectedCharacters = [{ id: 1, name: 'Character 1' }];
      mockPrismaService.character.findMany.mockResolvedValue(expectedCharacters);

      const result = await charactersService.findAll();

      expect(result).toEqual(expectedCharacters);
    });

    it('should return filtered characters when name is provided', async () => {
      const expectedCharacters = [{ id: 1, name: 'Character 1' }];
      const name = 'Character';
      mockPrismaService.character.findMany.mockResolvedValue(expectedCharacters);

      const result = await charactersService.findAll(0, 10, name);

      expect(result).toEqual(expectedCharacters);
      expect(mockPrismaService.character.findMany).toHaveBeenCalledWith({
        where: {
          name: {
            contains: name,
            mode: 'insensitive'
          }
        },
        skip: 0,
        take: 10
      });
    });
  });

  describe('findOne', () => {
    it('should return a single character', async () => {
      const expectedCharacter = { id: 1, name: 'Character 1' };
      const characterId = 1;
      mockPrismaService.character.findUnique.mockResolvedValue(expectedCharacter);

      const result = await charactersService.findOne(characterId);

      expect(result).toEqual(expectedCharacter);
      expect(mockPrismaService.character.findUnique).toHaveBeenCalledWith({
        where: { id: characterId }
      });
    });
  });
});
