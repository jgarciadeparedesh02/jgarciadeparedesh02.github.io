from pyspark.sql import SparkSession
from pyspark.sql.functions import col, count, avg, max, min, desc, year, month, to_timestamp

# Crear sesión de Spark
spark = SparkSession.builder \
    .appName("TaxiAnalysis") \
    .master("local[*]") \
    .getOrCreate()

# Leer el CSV (asegúrate de que la ruta al archivo sea válida)
df = spark.read.option("header", True).csv("file:///root/nyc_taxi_sample.csv", inferSchema=True)

# Mostrar primeras filas
print("="*50)
print("Primeras 5 filas del DataFrame:")
df.show(5)
print("="*50)

# Mostrar esquema (tipos de datos)
print("Esquema del DataFrame:")
df.printSchema()
print("="*50)

# Contar cuántas filas hay
print(f"Número de registros: {df.count()}")
print("="*50)

# Ver columnas
print("Columnas en el DataFrame:", df.columns)
print("="*50)

# Ver las 10 tarifas más altas
print("Las 10 tarifas más altas:")
df.select("total_amount").orderBy(col("total_amount").desc()).show(10)
print("="*50)

# Convertir columna de fecha/hora a timestamp (suponiendo que exista 'tpep_pickup_datetime')
df = df.withColumn("pickup_datetime", to_timestamp(col("tpep_pickup_datetime")))

# Filtrar viajes que costaron más de $100
print("Viajes que costaron más de $100:")
df.filter(col("total_amount") > 100).show(5)
print("="*50)

# Agregar: tarifa promedio por número de pasajeros
print("Promedio de tarifa por número de pasajeros:")
df.groupBy("passenger_count") \
    .agg(avg("total_amount").alias("avg_fare")) \
    .orderBy("passenger_count") \
    .show()
print("="*50)

# Número de viajes por mes
print("Número de viajes por mes:")
df.withColumn("month", month(col("pickup_datetime"))) \
    .groupBy("month") \
    .count() \
    .orderBy("month") \
    .show()
print("="*50)

# Top 5 ubicaciones de recogida más comunes (pickup_location_id)
if "PULocationID" in df.columns:
    print("Top 5 ubicaciones de recogida más comunes:")
    df.groupBy("PULocationID") \
        .agg(count("*").alias("trip_count")) \
        .orderBy(desc("trip_count")) \
        .show(5)
print("="*50)

# Filtrar viajes sin propina
print("Viajes sin propina:")
df.filter(col("tip_amount") == 0).show(5)
print("="*50)

# Exportar resultados a CSV
output_df = df.select("passenger_count", "trip_distance", "total_amount")
output_df.write.mode("overwrite").csv("file:///root/nyc_output.csv", header=True)
print("Datos exportados a 'nyc_output.csv'.")
