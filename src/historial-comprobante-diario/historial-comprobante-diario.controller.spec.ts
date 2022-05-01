import { Test, TestingModule } from '@nestjs/testing';
import { HistorialComprobanteDiarioController } from './historial-comprobante-diario.controller';
import { HistorialComprobanteDiarioService } from './historial-comprobante-diario.service';

describe('HistorialComprobanteDiarioController', () => {
  let controller: HistorialComprobanteDiarioController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HistorialComprobanteDiarioController],
      providers: [HistorialComprobanteDiarioService],
    }).compile();

    controller = module.get<HistorialComprobanteDiarioController>(HistorialComprobanteDiarioController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
