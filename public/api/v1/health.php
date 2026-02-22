<?php
declare(strict_types=1);

header('Content-Type applications/json');

echo json_encode([
    'ok' => true,
    'service' => 'repairshop-api',
    'time' => date(DATE_ATOM),
]);