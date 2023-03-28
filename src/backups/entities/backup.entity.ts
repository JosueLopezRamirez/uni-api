import { Column, Entity } from "typeorm";
import { BaseEntity } from "../../utils/base.entity";

@Entity()
export class Backup extends BaseEntity {
    @Column()
    name: string;

    @Column()
    url: string;
}
