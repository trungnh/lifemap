<h1>Members List</h1>

<table>
  <thead>
    <tr>
      <th>Id</th>
      <th>Name</th>
      <th>Invite member</th>
      <th>Is login rejected</th>
      <th>Created at</th>
      <th>Updated at</th>
      <th>Is active</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($members as $member): ?>
    <tr>
      <td><a href="<?php echo url_for('member/show?id='.$member->getId()) ?>"><?php echo $member->getId() ?></a></td>
      <td><?php echo $member->getName() ?></td>
      <td><?php echo $member->getInviteMemberId() ?></td>
      <td><?php echo $member->getIsLoginRejected() ?></td>
      <td><?php echo $member->getCreatedAt() ?></td>
      <td><?php echo $member->getUpdatedAt() ?></td>
      <td><?php echo $member->getIsActive() ?></td>
    </tr>
    <?php endforeach; ?>
  </tbody>
</table>

  <a href="<?php echo url_for('member/new') ?>">New</a>
