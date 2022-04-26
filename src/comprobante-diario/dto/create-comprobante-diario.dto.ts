import { CreateComprobanteDiarioItemDto } from 'src/comprobante-diario-item/dto/create-comprobante-diario-item.dto';

export class CreateComprobanteDiarioDto {
  empresaId: string;
}

export class DetalleComprobanteDto {
  comprobante: CreateComprobanteDiarioDto;
  comprobanteItems: CreateComprobanteDiarioItemDto[];
}
