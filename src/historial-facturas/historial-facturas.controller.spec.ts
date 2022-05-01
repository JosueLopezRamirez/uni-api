import { Test, TestingModule } from '@nestjs/testing';
import { HistorialFacturasController } from './historial-facturas.controller';
import { HistorialFacturasService } from './historial-facturas.service';

describe('HistorialFacturasController', () => {
  let controller: HistorialFacturasController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HistorialFacturasController],
      providers: [HistorialFacturasService],
    }).compile();

    controller = module.get<HistorialFacturasController>(HistorialFacturasController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
