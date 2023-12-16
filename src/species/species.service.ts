import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class SpeciesService {
  constructor(private prisma: PrismaService) {}

  async findAll(skip = 0, take = 10, name?: string) {
    const where: Prisma.SpeciesWhereInput = {};

    if (name) {
      where.name = {
        contains: name,
        mode: 'insensitive'
      };
    }

    return this.prisma.species.findMany({
      where,
      skip,
      take
    });
  }

  async findOne(id: number) {
    return this.prisma.species.findUnique({
      where: { id }
    });
  }
}
