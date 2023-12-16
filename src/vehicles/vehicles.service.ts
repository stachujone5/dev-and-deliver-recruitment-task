import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class VehiclesService {
  constructor(private prisma: PrismaService) {}

  async findAll(skip = 0, take = 10, name?: string) {
    const where: Prisma.VehicleWhereInput = {};

    if (name) {
      where.name = {
        contains: name,
        mode: 'insensitive'
      };
    }

    return this.prisma.vehicle.findMany({
      where,
      include: {
        films: true,
        pilots: true
      },
      skip,
      take
    });
  }

  async findOne(id: number) {
    return this.prisma.vehicle.findUnique({
      where: { id },
      include: {
        films: true,
        pilots: true
      }
    });
  }
}
