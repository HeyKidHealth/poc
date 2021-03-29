//RELATE ALL MEASUREMENTS WITH THEIR UNITS
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Height' AND unit.name = 'Centimeter' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Weight' AND unit.name = 'Kilogram ' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Systolic Blood Pressure' AND unit.name = 'Millimeters of Mercury' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Diastolic Blood Pressure' AND unit.name = 'Millimeters of Mercury' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Temperature' AND unit.name = 'Celsius' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Sleep' AND unit.name = 'None' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Stress' AND unit.name = 'None' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Glucose' AND unit.name = 'Millimoles per Litre' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Apgar Score' AND unit.name = 'None' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Thoracic Circumference' AND unit.name = 'Centimeter' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Head Circumference' AND unit.name = 'Centimeter' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Abdominal Circumference' AND unit.name = 'Centimeter' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Birth Weight' AND unit.name = 'Gram' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
MATCH (meas:Measurement), (unit:MeasurementUnit) WHERE meas.name = 'Birth Height' AND unit.name = 'Centimeter' MERGE (meas)-[:IS_MEASURED_IN]->(unit);
