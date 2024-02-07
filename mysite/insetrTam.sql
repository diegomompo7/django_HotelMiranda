DELETE FROM polls_booking;
INSERT INTO `polls_booking` (`name`, `orderDate`, `check_in`, `hour_in`, `check_out`, `hour_out`, `room_id`, `specialRequest`, `status`)
VALUES
('Juan Pérez', '2024-02-06', '2024-03-06', '15:00', '2024-03-09', '11:00', 58, 'Necesita cama adicional', 'Check In'),
('María López', '2024-02-07', '2024-03-10', '14:30', '2024-03-15', '10:30', 60, NULL, 'Check In'),
('Roberto Sánchez', '2024-02-08', '2024-03-05', '16:45', '2024-03-08', '12:00', 65, NULL, 'Check In'),
('Ana Martínez', '2024-02-09', '2024-03-12', '13:00', '2024-03-17', '09:00', 67, 'Preferencia por una habitación tranquila', 'Check In'),
('Pedro García', '2024-02-10', '2024-03-08', '17:30', '2024-03-11', '10:30', 62, NULL, 'Check In'),
('Laura Rodríguez', '2024-02-11', '2024-03-15', '12:00', '2024-03-20', '11:00', 54, 'Pet friendly', 'Check In'),
('Carlos Gómez', '2024-02-12', '2024-03-17', '14:00', '2024-03-22', '09:30', 56, NULL, 'Check In'),
('Sofía Fernández', '2024-02-13', '2024-03-09', '15:45', '2024-03-14', '12:30', 61, 'Necesita habitación con vista a la montaña', 'Check In'),
('Daniel Ruiz', '2024-02-14', '2024-03-06', '18:00', '2024-03-09', '10:00', 63, NULL, 'Check In'),
('Elena Serrano', '2024-02-15', '2024-03-11', '11:30', '2024-03-16', '10:30', 64, 'Requiere cuna para bebé', 'Check In'),
('Javier Hernández', '2024-02-16', '2024-03-18', '16:15', '2024-03-23', '11:30', 66, NULL, 'Check In'),
('Andrea Díaz', '2024-02-17', '2024-03-20', '13:45', '2024-03-25', '12:00', 68, 'Pet friendly', 'Check In'),
('David Muñoz', '2024-02-18', '2024-03-05', '19:00', '2024-03-08', '09:00', 55, NULL, 'Check In'),
('Paula Castro', '2024-02-19', '2024-03-14', '10:00', '2024-03-19', '11:00', 57, NULL, 'Check In'),
('Mario Bravo', '2024-02-20', '2024-03-08', '14:30', '2024-03-11', '10:00', 59, 'Necesita habitación con terraza', 'Check In');