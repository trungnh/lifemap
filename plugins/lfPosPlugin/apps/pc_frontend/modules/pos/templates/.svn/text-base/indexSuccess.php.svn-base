<h1>Gps device logs List</h1>

<table>
  <thead>
    <tr>
      <th>Id</th>
      <th>Serial number</th>
      <th>Authorized number</th>
      <th>Gprmc</th>
      <th>Times</th>
      <th>Status</th>
      <th>Latitude</th>
      <th>Ns indicator</th>
      <th>Longitude</th>
      <th>Ew indicator</th>
      <th>Speed</th>
      <th>Bearing</th>
      <th>Date</th>
      <th>Magnetic variation</th>
      <th>Variation sense</th>
      <th>Mode</th>
      <th>Checksum</th>
      <th>Signal</th>
      <th>Command</th>
      <th>Imei number</th>
      <th>Crc16 checksum</th>
      <th>Ip address</th>
      <th>Content</th>
      <th>Response code</th>
      <th>Created at</th>
      <th>Updated at</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($gps_device_logs as $gps_device_log): ?>
    <tr>
      <td><a href="<?php echo url_for('devicelog/show?id='.$gps_device_log->getId()) ?>"><?php echo $gps_device_log->getId() ?></a></td>
      <td><?php echo $gps_device_log->getSerialNumber() ?></td>
      <td><?php echo $gps_device_log->getAuthorizedNumber() ?></td>
      <td><?php echo $gps_device_log->getGprmc() ?></td>
      <td><?php echo $gps_device_log->getTimes() ?></td>
      <td><?php echo $gps_device_log->getStatus() ?></td>
      <td><?php echo $gps_device_log->getLatitude() ?></td>
      <td><?php echo $gps_device_log->getNsIndicator() ?></td>
      <td><?php echo $gps_device_log->getLongitude() ?></td>
      <td><?php echo $gps_device_log->getEwIndicator() ?></td>
      <td><?php echo $gps_device_log->getSpeed() ?></td>
      <td><?php echo $gps_device_log->getBearing() ?></td>
      <td><?php echo $gps_device_log->getDate() ?></td>
      <td><?php echo $gps_device_log->getMagneticVariation() ?></td>
      <td><?php echo $gps_device_log->getVariationSense() ?></td>
      <td><?php echo $gps_device_log->getMode() ?></td>
      <td><?php echo $gps_device_log->getChecksum() ?></td>
      <td><?php echo $gps_device_log->getSignal() ?></td>
      <td><?php echo $gps_device_log->getCommand() ?></td>
      <td><?php echo $gps_device_log->getImeiNumber() ?></td>
      <td><?php echo $gps_device_log->getCrc16Checksum() ?></td>
      <td><?php echo $gps_device_log->getIpAddress() ?></td>
      <td><?php echo $gps_device_log->getContent() ?></td>
      <td><?php echo $gps_device_log->getResponseCode() ?></td>
      <td><?php echo $gps_device_log->getCreatedAt() ?></td>
      <td><?php echo $gps_device_log->getUpdatedAt() ?></td>
    </tr>
    <?php endforeach; ?>
  </tbody>
</table>

  <a href="<?php echo url_for('devicelog/new') ?>">New</a>
