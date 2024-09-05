"use server";

import { PrismaClient } from "@prisma/client";
import { denominaciones } from "./denominaciones";
import { productos } from "./productos";
import { tipos } from "./tipos";
import { provincias } from "./provincias";
import { poblaciones } from "./poblaciones";

const prisma = new PrismaClient();

export async function dbSeeder() {
  console.log("dbSeeder");

  // Purga las tablas
  await prisma.denominaciones.deleteMany({ where: { id: { gt: 0 } } });
  await prisma.tipos.deleteMany({ where: { id: { gt: 0 } } });
  await prisma.productos.deleteMany({ where: { id: { gt: 0 } } });
  await prisma.provincia.deleteMany({ where: { id: { gt: 0 } } }); // Asegúrate de purgar la tabla de provincias
  await prisma.poblacion.deleteMany({ where: { id: { gt: 0 } } }); // Asegúrate de purgar la tabla de poblaciones

  // Inserta las denominaciones en la base de datos
  try {
    await prisma.denominaciones.createMany({
      data: denominaciones,
      skipDuplicates: true, // Ignora registros con valores duplicados
    });
    console.log("Denominaciones insertadas correctamente.");
  } catch (error) {
    console.error("Error al insertar denominaciones:", error);
  }

  // Inserta las provincias en la base de datos
  try {
    await prisma.provincia.createMany({
      data: provincias,
      skipDuplicates: true, // Ignora registros con valores duplicados
    });
    console.log("Provincias insertadas correctamente.");
  } catch (error) {
    console.error("Error al insertar provincias:", error);
  }

  // Inserta las poblaciones en la base de datos
  try {
    await prisma.poblacion.createMany({
      data: poblaciones,
      skipDuplicates: true, // Ignora registros con valores duplicados
    });
    console.log("Poblaciones insertadas correctamente.");
  } catch (error) {
    console.error("Error al insertar poblaciones:", error);
  }

  // Inserta los tipos en la base de datos
  try {
    await prisma.tipos.createMany({
      data: tipos,
      skipDuplicates: true, // Ignora registros con valores duplicados
    });
    console.log("Tipos insertados correctamente.");
  } catch (error) {
    console.error("Error al insertar tipos:", error);
  }

  // Inserta los productos en la base de datos
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

  console.log("Datos de seed insertados correctamente.");
}
