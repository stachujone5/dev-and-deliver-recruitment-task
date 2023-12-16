/*
  Warnings:

  - The primary key for the `Character` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `films` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `planets` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `species` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `starships` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `vehicles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[name]` on the table `Character` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[title]` on the table `films` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `planets` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `species` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `starships` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `vehicles` will be added. If there are existing duplicate values, this will fail.
  - Changed the type of `A` on the `_CharacterToFilm` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_CharacterToFilm` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_CharacterToSpecies` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_CharacterToSpecies` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_CharacterToStarship` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_CharacterToStarship` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_CharacterToVehicle` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_CharacterToVehicle` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_FilmToPlanet` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_FilmToPlanet` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_FilmToSpecies` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_FilmToSpecies` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_FilmToStarship` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_FilmToStarship` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_FilmToVehicle` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_FilmToVehicle` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "_CharacterToFilm" DROP CONSTRAINT "_CharacterToFilm_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToFilm" DROP CONSTRAINT "_CharacterToFilm_B_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToSpecies" DROP CONSTRAINT "_CharacterToSpecies_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToSpecies" DROP CONSTRAINT "_CharacterToSpecies_B_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToStarship" DROP CONSTRAINT "_CharacterToStarship_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToStarship" DROP CONSTRAINT "_CharacterToStarship_B_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToVehicle" DROP CONSTRAINT "_CharacterToVehicle_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToVehicle" DROP CONSTRAINT "_CharacterToVehicle_B_fkey";

-- DropForeignKey
ALTER TABLE "_FilmToPlanet" DROP CONSTRAINT "_FilmToPlanet_A_fkey";

-- DropForeignKey
ALTER TABLE "_FilmToPlanet" DROP CONSTRAINT "_FilmToPlanet_B_fkey";

-- DropForeignKey
ALTER TABLE "_FilmToSpecies" DROP CONSTRAINT "_FilmToSpecies_A_fkey";

-- DropForeignKey
ALTER TABLE "_FilmToSpecies" DROP CONSTRAINT "_FilmToSpecies_B_fkey";

-- DropForeignKey
ALTER TABLE "_FilmToStarship" DROP CONSTRAINT "_FilmToStarship_A_fkey";

-- DropForeignKey
ALTER TABLE "_FilmToStarship" DROP CONSTRAINT "_FilmToStarship_B_fkey";

-- DropForeignKey
ALTER TABLE "_FilmToVehicle" DROP CONSTRAINT "_FilmToVehicle_A_fkey";

-- DropForeignKey
ALTER TABLE "_FilmToVehicle" DROP CONSTRAINT "_FilmToVehicle_B_fkey";

-- AlterTable
ALTER TABLE "Character" DROP CONSTRAINT "Character_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Character_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "_CharacterToFilm" DROP COLUMN "A",
ADD COLUMN     "A" INTEGER NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "_CharacterToSpecies" DROP COLUMN "A",
ADD COLUMN     "A" INTEGER NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "_CharacterToStarship" DROP COLUMN "A",
ADD COLUMN     "A" INTEGER NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "_CharacterToVehicle" DROP COLUMN "A",
ADD COLUMN     "A" INTEGER NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "_FilmToPlanet" DROP COLUMN "A",
ADD COLUMN     "A" INTEGER NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "_FilmToSpecies" DROP COLUMN "A",
ADD COLUMN     "A" INTEGER NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "_FilmToStarship" DROP COLUMN "A",
ADD COLUMN     "A" INTEGER NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "_FilmToVehicle" DROP COLUMN "A",
ADD COLUMN     "A" INTEGER NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "films" DROP CONSTRAINT "films_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "films_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "planets" DROP CONSTRAINT "planets_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "planets_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "species" DROP CONSTRAINT "species_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "species_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "starships" DROP CONSTRAINT "starships_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "starships_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "vehicles" DROP CONSTRAINT "vehicles_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "vehicles_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "Character_name_key" ON "Character"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToFilm_AB_unique" ON "_CharacterToFilm"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToFilm_B_index" ON "_CharacterToFilm"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToSpecies_AB_unique" ON "_CharacterToSpecies"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToSpecies_B_index" ON "_CharacterToSpecies"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToStarship_AB_unique" ON "_CharacterToStarship"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToStarship_B_index" ON "_CharacterToStarship"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToVehicle_AB_unique" ON "_CharacterToVehicle"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToVehicle_B_index" ON "_CharacterToVehicle"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FilmToPlanet_AB_unique" ON "_FilmToPlanet"("A", "B");

-- CreateIndex
CREATE INDEX "_FilmToPlanet_B_index" ON "_FilmToPlanet"("B");

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
CREATE UNIQUE INDEX "films_title_key" ON "films"("title");

-- CreateIndex
CREATE UNIQUE INDEX "planets_name_key" ON "planets"("name");

-- CreateIndex
CREATE UNIQUE INDEX "species_name_key" ON "species"("name");

-- CreateIndex
CREATE UNIQUE INDEX "starships_name_key" ON "starships"("name");

-- CreateIndex
CREATE UNIQUE INDEX "vehicles_name_key" ON "vehicles"("name");

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
ALTER TABLE "_CharacterToFilm" ADD CONSTRAINT "_CharacterToFilm_B_fkey" FOREIGN KEY ("B") REFERENCES "films"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpecies" ADD CONSTRAINT "_CharacterToSpecies_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpecies" ADD CONSTRAINT "_CharacterToSpecies_B_fkey" FOREIGN KEY ("B") REFERENCES "species"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToStarship" ADD CONSTRAINT "_CharacterToStarship_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToStarship" ADD CONSTRAINT "_CharacterToStarship_B_fkey" FOREIGN KEY ("B") REFERENCES "starships"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToVehicle" ADD CONSTRAINT "_CharacterToVehicle_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToVehicle" ADD CONSTRAINT "_CharacterToVehicle_B_fkey" FOREIGN KEY ("B") REFERENCES "vehicles"("id") ON DELETE CASCADE ON UPDATE CASCADE;
