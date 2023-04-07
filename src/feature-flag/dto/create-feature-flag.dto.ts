import { IsBoolean, IsNotEmpty, IsString } from "class-validator";

export class CreateFeatureFlagDto {
    @IsString()
    @IsNotEmpty()
    name:string;

    @IsBoolean()
    active: boolean;
}
