import { Module } from '@nestjs/common';
import { ComprobanteDiarioService } from './comprobante-diario.service';
import { ComprobanteDiarioController } from './comprobante-diario.controller';
import { ComprobanteDiario } from './entities/comprobante-diario.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ComprobanteDiarioItemModule } from 'src/comprobante-diario-item/comprobante-diario-item.module';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports: [
    ComprobanteDiarioItemModule,
    TypeOrmModule.forFeature([ComprobanteDiario]),
    JwtModule.register({
      secret: 'secret',
      signOptions: { expiresIn: '24h' },
    }),
  ],
  controllers: [ComprobanteDiarioController],
  providers: [ComprobanteDiarioService],
})
export class ComprobanteDiarioModule {}
