<h1>Poss List</h1>

<table>
  <thead>
    <tr>
      <th>Id</th>
      <th>Title</th>
      <th>Description</th>
      <th>Address</th>
      <th>Tel</th>
      <th>Website</th>
      <th>Lat</th>
      <th>Lng</th>
      <th>Tags</th>
      <th>File</th>
      <th>Member</th>
      <th>Ower</th>
      <th>Is public</th>
      <th>Created at</th>
      <th>Updated at</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($poss as $pos): ?>
    <tr>
      <td><a href="<?php echo url_for('pos/show?id='.$pos->getId()) ?>"><?php echo $pos->getId() ?></a></td>
      <td><?php echo $pos->getTitle() ?></td>
      <td><?php echo $pos->getDescription() ?></td>
      <td><?php echo $pos->getAddress() ?></td>
      <td><?php echo $pos->getTel() ?></td>
      <td><?php echo $pos->getWebsite() ?></td>
      <td><?php echo $pos->getLat() ?></td>
      <td><?php echo $pos->getLng() ?></td>
      <td><?php echo $pos->getTags() ?></td>
      <td><?php echo $pos->getFileId() ?></td>
      <td><?php echo $pos->getMemberId() ?></td>
      <td><?php echo $pos->getOwerId() ?></td>
      <td><?php echo $pos->getIsPublic() ?></td>
      <td><?php echo $pos->getCreatedAt() ?></td>
      <td><?php echo $pos->getUpdatedAt() ?></td>
    </tr>
    <?php endforeach; ?>
  </tbody>
</table>

  <a href="<?php echo url_for('pos/new') ?>">New</a>
