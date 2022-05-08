import { Injectable } from '@nestjs/common';
import { CreateDocumentoDto } from './dto/create-documento.dto';
import { UpdateDocumentoDto } from './dto/update-documento.dto';

@Injectable()
export class DocumentoService {
  create(createDocumentoDto: CreateDocumentoDto) {
    return 'This action adds a new documento';
  }

  findAll() {
    return `This action returns all documento`;
  }

  findOne(id: string) {
    return `This action returns a #${id} documento`;
  }

  update(id: string, updateDocumentoDto: UpdateDocumentoDto) {
    return `This action updates a #${id} documento`;
  }

  remove(id: string) {
    return `This action removes a #${id} documento`;
  }
}
