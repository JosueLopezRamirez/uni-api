import { Test, TestingModule } from '@nestjs/testing';
import { DinamicosController } from './dinamicos.controller';
import { DinamicosService } from './dinamicos.service';

describe('DinamicosController', () => {
  let controller: DinamicosController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [DinamicosController],
      providers: [DinamicosService],
    }).compile();

    controller = module.get<DinamicosController>(DinamicosController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
