import { Controller, Get, Param } from '@nestjs/common';
import { SharedService } from './shared.service';

@Controller('shared')
export class SharedController {
  constructor(private readonly sharedService: SharedService) {}

  @Get("/db-backup")
  dbBackup() {
    return this.sharedService.dbBackup();
  }

  @Get("/db-restore/:id")
  dbRestore(@Param('id') id: string) {
    return this.sharedService.dbRestore(id);
  }
}
