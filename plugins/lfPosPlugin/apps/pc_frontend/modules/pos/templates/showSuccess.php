<table>
  <tbody>
    <tr>
      <th>Id:</th>
      <td><?php echo $gps_device_log->getId() ?></td>
    </tr>
    <tr>
      <th>Serial number:</th>
      <td><?php echo $gps_device_log->getSerialNumber() ?></td>
    </tr>
    <tr>
      <th>Authorized number:</th>
      <td><?php echo $gps_device_log->getAuthorizedNumber() ?></td>
    </tr>
    <tr>
      <th>Gprmc:</th>
      <td><?php echo $gps_device_log->getGprmc() ?></td>
    </tr>
    <tr>
      <th>Times:</th>
      <td><?php echo $gps_device_log->getTimes() ?></td>
    </tr>
    <tr>
      <th>Status:</th>
      <td><?php echo $gps_device_log->getStatus() ?></td>
    </tr>
    <tr>
      <th>Latitude:</th>
      <td><?php echo $gps_device_log->getLatitude() ?></td>
    </tr>
    <tr>
      <th>Ns indicator:</th>
      <td><?php echo $gps_device_log->getNsIndicator() ?></td>
    </tr>
    <tr>
      <th>Longitude:</th>
      <td><?php echo $gps_device_log->getLongitude() ?></td>
    </tr>
    <tr>
      <th>Ew indicator:</th>
      <td><?php echo $gps_device_log->getEwIndicator() ?></td>
    </tr>
    <tr>
      <th>Speed:</th>
      <td><?php echo $gps_device_log->getSpeed() ?></td>
    </tr>
    <tr>
      <th>Bearing:</th>
      <td><?php echo $gps_device_log->getBearing() ?></td>
    </tr>
    <tr>
      <th>Date:</th>
      <td><?php echo $gps_device_log->getDate() ?></td>
    </tr>
    <tr>
      <th>Magnetic variation:</th>
      <td><?php echo $gps_device_log->getMagneticVariation() ?></td>
    </tr>
    <tr>
      <th>Variation sense:</th>
      <td><?php echo $gps_device_log->getVariationSense() ?></td>
    </tr>
    <tr>
      <th>Mode:</th>
      <td><?php echo $gps_device_log->getMode() ?></td>
    </tr>
    <tr>
      <th>Checksum:</th>
      <td><?php echo $gps_device_log->getChecksum() ?></td>
    </tr>
    <tr>
      <th>Signal:</th>
      <td><?php echo $gps_device_log->getSignal() ?></td>
    </tr>
    <tr>
      <th>Command:</th>
      <td><?php echo $gps_device_log->getCommand() ?></td>
    </tr>
    <tr>
      <th>Imei number:</th>
      <td><?php echo $gps_device_log->getImeiNumber() ?></td>
    </tr>
    <tr>
      <th>Crc16 checksum:</th>
      <td><?php echo $gps_device_log->getCrc16Checksum() ?></td>
    </tr>
    <tr>
      <th>Ip address:</th>
      <td><?php echo $gps_device_log->getIpAddress() ?></td>
    </tr>
    <tr>
      <th>Content:</th>
      <td><?php echo $gps_device_log->getContent() ?></td>
    </tr>
    <tr>
      <th>Response code:</th>
      <td><?php echo $gps_device_log->getResponseCode() ?></td>
    </tr>
    <tr>
      <th>Created at:</th>
      <td><?php echo $gps_device_log->getCreatedAt() ?></td>
    </tr>
    <tr>
      <th>Updated at:</th>
      <td><?php echo $gps_device_log->getUpdatedAt() ?></td>
    </tr>
  </tbody>
</table>

<hr />

<a href="<?php echo url_for('devicelog/edit?id='.$gps_device_log->getId()) ?>">Edit</a>
&nbsp;
<a href="<?php echo url_for('devicelog/index') ?>">List</a>
