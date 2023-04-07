import { IsNotEmpty, IsString } from "class-validator";

export class CreateFeatureFlagUserDto {
    @IsString()
    @IsNotEmpty()
    usuarioId:string;

    @IsString()
    @IsNotEmpty()
    featureFlagId: string;
}
