import { Test, TestingModule } from '@nestjs/testing';
import { HistorialFacturasService } from './historial-facturas.service';

describe('HistorialFacturasService', () => {
  let service: HistorialFacturasService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [HistorialFacturasService],
    }).compile();

    service = module.get<HistorialFacturasService>(HistorialFacturasService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
