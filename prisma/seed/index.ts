import { PrismaClient } from "@prisma/client";
import { denominaciones } from "./data/denominaciones";
import { productos } from "./data/productos";
import { tipos } from "./data/tipos";
import { provincias } from "./data/provincias";
import { poblaciones } from "./data/poblaciones";

const prisma = new PrismaClient();

export async function dbSeeder() {
  console.log("dbSeeder iniciado...");

  // Purga las tablas
  await prisma.denominaciones.deleteMany();
  await prisma.tipos.deleteMany();
  await prisma.productos.deleteMany();
  await prisma.provincia.deleteMany();
  await prisma.poblacion.deleteMany();

  // Inserta las denominaciones en la base de datos
  try {
    await prisma.denominaciones.createMany({
      data: denominaciones,
      skipDuplicates: true, // Ignora duplicados
    });
    console.log("Denominaciones insertadas correctamente.");
  } catch (error) {
    console.error("Error al insertar denominaciones:", error);
  }

  // Inserta las provincias en la base de datos
  try {
    await prisma.provincia.createMany({
      data: provincias,
      skipDuplicates: true,
    });
    console.log("Provincias insertadas correctamente.");
  } catch (error) {
    console.error("Error al insertar provincias:", error);
  }

  // Inserta las poblaciones en la base de datos
  try {
    await prisma.poblacion.createMany({
      data: poblaciones,
      skipDuplicates: true,
    });
    console.log("Poblaciones insertadas correctamente.");
  } catch (error) {
    console.error("Error al insertar poblaciones:", error);
  }

  // Inserta los tipos en la base de datos
  try {
    await prisma.tipos.createMany({
      data: tipos,
      skipDuplicates: true,
    });
    console.log("Tipos insertados correctamente.");
  } catch (error) {
    console.error("Error al insertar tipos:", error);
  }

  // Inserta los productos en la base de datos uno por uno
  for (const producto of productos) {
    try {
      await prisma.productos.create({
        data: producto,
      });
      console.log(`Producto ${producto.nombre} creado correctamente.`);
    } catch (error) {
      console.error(`Error al crear el producto ${producto.nombre}:`, error);
    }
  }

  console.log("Seed completado correctamente.");
}

dbSeeder()
  .catch((error) => {
    console.error("Error durante el seed:", error);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
