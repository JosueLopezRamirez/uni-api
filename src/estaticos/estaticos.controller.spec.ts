import { Test, TestingModule } from '@nestjs/testing';
import { EstaticosController } from './estaticos.controller';
import { EstaticosService } from './estaticos.service';

describe('EstaticosController', () => {
  let controller: EstaticosController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [EstaticosController],
      providers: [EstaticosService],
    }).compile();

    controller = module.get<EstaticosController>(EstaticosController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
