import { Test, TestingModule } from '@nestjs/testing';
import { HistorialComprobanteDiarioService } from './historial-comprobante-diario.service';

describe('HistorialComprobanteDiarioService', () => {
  let service: HistorialComprobanteDiarioService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [HistorialComprobanteDiarioService],
    }).compile();

    service = module.get<HistorialComprobanteDiarioService>(HistorialComprobanteDiarioService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
