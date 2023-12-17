import { Test, TestingModule } from '@nestjs/testing';
import { PrismaService } from './prisma.service';

describe('PrismaService', () => {
  let prismaService: PrismaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PrismaService]
    }).compile();

    prismaService = module.get<PrismaService>(PrismaService);
  });

  it('should be defined', () => {
    expect(prismaService).toBeDefined();
  });

  it('should call onModuleInit', async () => {
    const onModuleInitSpy = jest.spyOn(prismaService, 'onModuleInit');
    await prismaService.onModuleInit();
    expect(onModuleInitSpy).toHaveBeenCalled();
  });

  it('should call onModuleDestroy', async () => {
    const onModuleDestroySpy = jest.spyOn(prismaService, 'onModuleDestroy');
    await prismaService.onModuleDestroy();
    expect(onModuleDestroySpy).toHaveBeenCalled();
  });
});
