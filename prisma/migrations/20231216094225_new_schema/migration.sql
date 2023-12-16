/*
  Warnings:

  - You are about to drop the column `createdAt` on the `films` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `films` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `planets` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `planets` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `species` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `species` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `starships` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `starships` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `vehicles` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `vehicles` table. All the data in the column will be lost.
  - You are about to drop the `characters` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `created` to the `films` table without a default value. This is not possible if the table is not empty.
  - Added the required column `edited` to the `films` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `films` table without a default value. This is not possible if the table is not empty.
  - Added the required column `climate` to the `planets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created` to the `planets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `diameter` to the `planets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `edited` to the `planets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gravity` to the `planets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orbitalPeriod` to the `planets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rotationPeriod` to the `planets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `surfaceWater` to the `planets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `planets` table without a default value. This is not possible if the table is not empty.
  - Added the required column `averageHeight` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `averageLifespan` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `classification` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `designation` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `edited` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `eyeColors` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hairColors` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `language` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `skinColors` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `species` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cargoCapacity` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `consumables` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `costInCredits` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `crew` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `edited` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hyperdriveRating` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `length` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `manufacturer` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `maxAtmospheringSpeed` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mglt` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `passengers` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `starshipClass` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `starships` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cargoCapacity` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `consumables` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `costInCredits` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `crew` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `edited` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `length` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `manufacturer` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `maxAtmospheringSpeed` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `passengers` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `vehicles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `vehicleClass` to the `vehicles` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_CharacterToFilm" DROP CONSTRAINT "_CharacterToFilm_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToSpecies" DROP CONSTRAINT "_CharacterToSpecies_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToStarship" DROP CONSTRAINT "_CharacterToStarship_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToVehicle" DROP CONSTRAINT "_CharacterToVehicle_A_fkey";

-- DropForeignKey
ALTER TABLE "characters" DROP CONSTRAINT "characters_planetId_fkey";

-- AlterTable
ALTER TABLE "films" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created" TEXT NOT NULL,
ADD COLUMN     "edited" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "planets" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "climate" TEXT NOT NULL,
ADD COLUMN     "created" TEXT NOT NULL,
ADD COLUMN     "diameter" TEXT NOT NULL,
ADD COLUMN     "edited" TEXT NOT NULL,
ADD COLUMN     "gravity" TEXT NOT NULL,
ADD COLUMN     "orbitalPeriod" TEXT NOT NULL,
ADD COLUMN     "rotationPeriod" TEXT NOT NULL,
ADD COLUMN     "surfaceWater" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL,
ALTER COLUMN "population" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "species" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "averageHeight" TEXT NOT NULL,
ADD COLUMN     "averageLifespan" TEXT NOT NULL,
ADD COLUMN     "classification" TEXT NOT NULL,
ADD COLUMN     "created" TEXT NOT NULL,
ADD COLUMN     "designation" TEXT NOT NULL,
ADD COLUMN     "edited" TEXT NOT NULL,
ADD COLUMN     "eyeColors" TEXT NOT NULL,
ADD COLUMN     "hairColors" TEXT NOT NULL,
ADD COLUMN     "language" TEXT NOT NULL,
ADD COLUMN     "planetId" INTEGER,
ADD COLUMN     "skinColors" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "starships" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "cargoCapacity" TEXT NOT NULL,
ADD COLUMN     "consumables" TEXT NOT NULL,
ADD COLUMN     "costInCredits" TEXT NOT NULL,
ADD COLUMN     "created" TEXT NOT NULL,
ADD COLUMN     "crew" TEXT NOT NULL,
ADD COLUMN     "edited" TEXT NOT NULL,
ADD COLUMN     "hyperdriveRating" TEXT NOT NULL,
ADD COLUMN     "length" TEXT NOT NULL,
ADD COLUMN     "manufacturer" TEXT NOT NULL,
ADD COLUMN     "maxAtmospheringSpeed" TEXT NOT NULL,
ADD COLUMN     "mglt" TEXT NOT NULL,
ADD COLUMN     "passengers" TEXT NOT NULL,
ADD COLUMN     "starshipClass" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "vehicles" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "cargoCapacity" TEXT NOT NULL,
ADD COLUMN     "consumables" TEXT NOT NULL,
ADD COLUMN     "costInCredits" TEXT NOT NULL,
ADD COLUMN     "created" TEXT NOT NULL,
ADD COLUMN     "crew" TEXT NOT NULL,
ADD COLUMN     "edited" TEXT NOT NULL,
ADD COLUMN     "length" TEXT NOT NULL,
ADD COLUMN     "manufacturer" TEXT NOT NULL,
ADD COLUMN     "maxAtmospheringSpeed" TEXT NOT NULL,
ADD COLUMN     "passengers" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL,
ADD COLUMN     "vehicleClass" TEXT NOT NULL;

-- DropTable
DROP TABLE "characters";

-- CreateTable
CREATE TABLE "Character" (
    "id" SERIAL NOT NULL,
    "birthYear" TEXT NOT NULL,
    "eyeColor" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "hairColor" TEXT NOT NULL,
    "height" TEXT NOT NULL,
    "mass" TEXT NOT NULL,
    "skinColor" TEXT NOT NULL,
    "planetId" INTEGER,
    "url" TEXT NOT NULL,
    "created" TEXT NOT NULL,
    "edited" TEXT NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FilmToSpecies" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_FilmToStarship" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_FilmToVehicle" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_FilmToPlanet" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_FilmToSpecies_AB_unique" ON "_FilmToSpecies"("A", "B");

-- CreateIndex
CREATE INDEX "_FilmToSpecies_B_index" ON "_FilmToSpecies"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FilmToStarship_AB_unique" ON "_FilmToStarship"("A", "B");

-- CreateIndex
CREATE INDEX "_FilmToStarship_B_index" ON "_FilmToStarship"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FilmToVehicle_AB_unique" ON "_FilmToVehicle"("A", "B");

-- CreateIndex
CREATE INDEX "_FilmToVehicle_B_index" ON "_FilmToVehicle"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FilmToPlanet_AB_unique" ON "_FilmToPlanet"("A", "B");

-- CreateIndex
CREATE INDEX "_FilmToPlanet_B_index" ON "_FilmToPlanet"("B");

-- AddForeignKey
ALTER TABLE "species" ADD CONSTRAINT "species_planetId_fkey" FOREIGN KEY ("planetId") REFERENCES "planets"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_planetId_fkey" FOREIGN KEY ("planetId") REFERENCES "planets"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToSpecies" ADD CONSTRAINT "_FilmToSpecies_A_fkey" FOREIGN KEY ("A") REFERENCES "films"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToSpecies" ADD CONSTRAINT "_FilmToSpecies_B_fkey" FOREIGN KEY ("B") REFERENCES "species"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToStarship" ADD CONSTRAINT "_FilmToStarship_A_fkey" FOREIGN KEY ("A") REFERENCES "films"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToStarship" ADD CONSTRAINT "_FilmToStarship_B_fkey" FOREIGN KEY ("B") REFERENCES "starships"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToVehicle" ADD CONSTRAINT "_FilmToVehicle_A_fkey" FOREIGN KEY ("A") REFERENCES "films"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToVehicle" ADD CONSTRAINT "_FilmToVehicle_B_fkey" FOREIGN KEY ("B") REFERENCES "vehicles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToPlanet" ADD CONSTRAINT "_FilmToPlanet_A_fkey" FOREIGN KEY ("A") REFERENCES "films"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToPlanet" ADD CONSTRAINT "_FilmToPlanet_B_fkey" FOREIGN KEY ("B") REFERENCES "planets"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToFilm" ADD CONSTRAINT "_CharacterToFilm_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpecies" ADD CONSTRAINT "_CharacterToSpecies_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToStarship" ADD CONSTRAINT "_CharacterToStarship_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToVehicle" ADD CONSTRAINT "_CharacterToVehicle_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;
