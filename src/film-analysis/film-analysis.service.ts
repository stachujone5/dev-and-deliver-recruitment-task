import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class FilmAnalysisService {
  constructor(private readonly prisma: PrismaService) {}

  async analyzeFilms() {
    const films = await this.prisma.film.findMany();
    const characters = await this.prisma.character.findMany();
    const wordsMap = new Map<string, number>();
    const characterOccurrences = new Map<string, number>();

    const characterNames = characters.map((character) => character.name.toLowerCase());

    for (const film of films) {
      const words = film.openingCrawl
        .replace(/[\r\n]+/g, ' ')
        .split(/\s+/)
        .filter((word) => word.trim() !== '');

      for (const word of words) {
        const cleanedWord = word.trim().toLowerCase();
        const count = wordsMap.get(cleanedWord) || 0;
        wordsMap.set(cleanedWord, count + 1);
      }

      for (const characterName of characterNames) {
        const regex = new RegExp(`\\b${characterName}\\b`, 'gi'); // Word boundary and case-insensitive search
        const matches = film.openingCrawl.match(regex);

        if (matches) {
          const charCount = characterOccurrences.get(characterName) || 0;
          characterOccurrences.set(characterName, charCount + matches.length);
        }
      }
    }

    let maxCount = 0;
    let mostFrequentCharacters = [];

    for (const [name, count] of characterOccurrences) {
      if (count > maxCount) {
        mostFrequentCharacters = [name];
        maxCount = count;
      } else if (count === maxCount) {
        mostFrequentCharacters.push(name);
      }
    }

    const uniqueWordsWithOccurrences = Array.from(wordsMap.entries());

    return {
      uniqueWordsWithOccurrences,
      mostFrequentCharacter: mostFrequentCharacters
    };
  }
}
