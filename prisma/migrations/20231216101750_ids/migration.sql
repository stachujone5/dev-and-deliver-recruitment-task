/*
  Warnings:

  - The primary key for the `Character` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `planetId` on the `Character` table. All the data in the column will be lost.
  - The primary key for the `films` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `films` table. All the data in the column will be lost.
  - The primary key for the `planets` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `planets` table. All the data in the column will be lost.
  - The primary key for the `species` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `species` table. All the data in the column will be lost.
  - You are about to drop the column `planetId` on the `species` table. All the data in the column will be lost.
  - The primary key for the `starships` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `starships` table. All the data in the column will be lost.
  - The primary key for the `vehicles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `vehicles` table. All the data in the column will be lost.
  - Added the required column `name` to the `Character` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_planetId_fkey";

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

-- DropForeignKey
ALTER TABLE "species" DROP CONSTRAINT "species_planetId_fkey";

-- AlterTable
ALTER TABLE "Character" DROP CONSTRAINT "Character_pkey",
DROP COLUMN "id",
DROP COLUMN "planetId",
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "planetName" TEXT,
ADD CONSTRAINT "Character_pkey" PRIMARY KEY ("name");

-- AlterTable
ALTER TABLE "_CharacterToFilm" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_CharacterToSpecies" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_CharacterToStarship" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_CharacterToVehicle" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_FilmToPlanet" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_FilmToSpecies" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_FilmToStarship" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_FilmToVehicle" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "films" DROP CONSTRAINT "films_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "films_pkey" PRIMARY KEY ("title");

-- AlterTable
ALTER TABLE "planets" DROP CONSTRAINT "planets_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "planets_pkey" PRIMARY KEY ("name");

-- AlterTable
ALTER TABLE "species" DROP CONSTRAINT "species_pkey",
DROP COLUMN "id",
DROP COLUMN "planetId",
ADD COLUMN     "planetName" TEXT,
ADD CONSTRAINT "species_pkey" PRIMARY KEY ("name");

-- AlterTable
ALTER TABLE "starships" DROP CONSTRAINT "starships_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "starships_pkey" PRIMARY KEY ("name");

-- AlterTable
ALTER TABLE "vehicles" DROP CONSTRAINT "vehicles_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "vehicles_pkey" PRIMARY KEY ("name");

-- AddForeignKey
ALTER TABLE "species" ADD CONSTRAINT "species_planetName_fkey" FOREIGN KEY ("planetName") REFERENCES "planets"("name") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_planetName_fkey" FOREIGN KEY ("planetName") REFERENCES "planets"("name") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToSpecies" ADD CONSTRAINT "_FilmToSpecies_A_fkey" FOREIGN KEY ("A") REFERENCES "films"("title") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToSpecies" ADD CONSTRAINT "_FilmToSpecies_B_fkey" FOREIGN KEY ("B") REFERENCES "species"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToStarship" ADD CONSTRAINT "_FilmToStarship_A_fkey" FOREIGN KEY ("A") REFERENCES "films"("title") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToStarship" ADD CONSTRAINT "_FilmToStarship_B_fkey" FOREIGN KEY ("B") REFERENCES "starships"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToVehicle" ADD CONSTRAINT "_FilmToVehicle_A_fkey" FOREIGN KEY ("A") REFERENCES "films"("title") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToVehicle" ADD CONSTRAINT "_FilmToVehicle_B_fkey" FOREIGN KEY ("B") REFERENCES "vehicles"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToPlanet" ADD CONSTRAINT "_FilmToPlanet_A_fkey" FOREIGN KEY ("A") REFERENCES "films"("title") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmToPlanet" ADD CONSTRAINT "_FilmToPlanet_B_fkey" FOREIGN KEY ("B") REFERENCES "planets"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToFilm" ADD CONSTRAINT "_CharacterToFilm_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToFilm" ADD CONSTRAINT "_CharacterToFilm_B_fkey" FOREIGN KEY ("B") REFERENCES "films"("title") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpecies" ADD CONSTRAINT "_CharacterToSpecies_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpecies" ADD CONSTRAINT "_CharacterToSpecies_B_fkey" FOREIGN KEY ("B") REFERENCES "species"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToStarship" ADD CONSTRAINT "_CharacterToStarship_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToStarship" ADD CONSTRAINT "_CharacterToStarship_B_fkey" FOREIGN KEY ("B") REFERENCES "starships"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToVehicle" ADD CONSTRAINT "_CharacterToVehicle_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToVehicle" ADD CONSTRAINT "_CharacterToVehicle_B_fkey" FOREIGN KEY ("B") REFERENCES "vehicles"("name") ON DELETE CASCADE ON UPDATE CASCADE;
