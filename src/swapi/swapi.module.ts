import { Module } from '@nestjs/common';
import { ScheduleModule } from '@nestjs/schedule';
import { SwapiService } from './swapi.service';

@Module({
  imports: [ScheduleModule.forRoot()],
  providers: [SwapiService]
})
export class SwapiModule {}
