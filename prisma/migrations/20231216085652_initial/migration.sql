-- CreateTable
CREATE TABLE "films" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "episodeId" INTEGER NOT NULL,
    "openingCrawl" TEXT NOT NULL,
    "director" TEXT NOT NULL,
    "producer" TEXT NOT NULL,
    "releaseDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "films_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "species" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "species_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vehicles" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "vehicles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "starships" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "starships_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "planets" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "terrain" TEXT NOT NULL,
    "population" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "planets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "characters" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "height" INTEGER NOT NULL,
    "mass" INTEGER NOT NULL,
    "hairColor" TEXT NOT NULL,
    "skinColor" TEXT NOT NULL,
    "eyeColor" TEXT NOT NULL,
    "birthYear" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "planetId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "characters_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CharacterToFilm" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CharacterToSpecies" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CharacterToVehicle" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CharacterToStarship" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToFilm_AB_unique" ON "_CharacterToFilm"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToFilm_B_index" ON "_CharacterToFilm"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToSpecies_AB_unique" ON "_CharacterToSpecies"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToSpecies_B_index" ON "_CharacterToSpecies"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToVehicle_AB_unique" ON "_CharacterToVehicle"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToVehicle_B_index" ON "_CharacterToVehicle"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToStarship_AB_unique" ON "_CharacterToStarship"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToStarship_B_index" ON "_CharacterToStarship"("B");

-- AddForeignKey
ALTER TABLE "characters" ADD CONSTRAINT "characters_planetId_fkey" FOREIGN KEY ("planetId") REFERENCES "planets"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToFilm" ADD CONSTRAINT "_CharacterToFilm_A_fkey" FOREIGN KEY ("A") REFERENCES "characters"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToFilm" ADD CONSTRAINT "_CharacterToFilm_B_fkey" FOREIGN KEY ("B") REFERENCES "films"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpecies" ADD CONSTRAINT "_CharacterToSpecies_A_fkey" FOREIGN KEY ("A") REFERENCES "characters"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpecies" ADD CONSTRAINT "_CharacterToSpecies_B_fkey" FOREIGN KEY ("B") REFERENCES "species"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToVehicle" ADD CONSTRAINT "_CharacterToVehicle_A_fkey" FOREIGN KEY ("A") REFERENCES "characters"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToVehicle" ADD CONSTRAINT "_CharacterToVehicle_B_fkey" FOREIGN KEY ("B") REFERENCES "vehicles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToStarship" ADD CONSTRAINT "_CharacterToStarship_A_fkey" FOREIGN KEY ("A") REFERENCES "characters"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToStarship" ADD CONSTRAINT "_CharacterToStarship_B_fkey" FOREIGN KEY ("B") REFERENCES "starships"("id") ON DELETE CASCADE ON UPDATE CASCADE;
