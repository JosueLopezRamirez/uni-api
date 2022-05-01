import { Test, TestingModule } from '@nestjs/testing';
import { FilasController } from './filas.controller';
import { FilasService } from './filas.service';

describe('FilasController', () => {
  let controller: FilasController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [FilasController],
      providers: [FilasService],
    }).compile();

    controller = module.get<FilasController>(FilasController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
