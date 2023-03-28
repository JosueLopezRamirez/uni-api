import { CreateComprobanteDiarioItemDto } from '../../comprobante-diario-item/dto/create-comprobante-diario-item.dto';

export class CreateComprobanteDiarioDto {
  nombre: string;
  fecha: string;
  empresaId: string;
}

export class DetalleComprobanteDto {
  comprobante: CreateComprobanteDiarioDto;
  comprobanteItems: CreateComprobanteDiarioItemDto[];
}
