app.post('/api/game/reward', async (req, res) => {
  const { telegramId, coins } = req.body;

  if (!telegramId || coins === undefined) {
    return res.status(400).json({ error: 'Missing parameters' });
  }

  try {
    let user = await User.findOne({ telegramId });

    if (user) {
      user.mainCoins += coins;
      user.weeklyCoins += coins;
      await user.save();

      return res.json({
        success: true,
        mainCoins: user.mainCoins,
        weeklyCoins: user.weeklyCoins
      });
    }

    return res.status(404).json({ error: 'User not found' });
  } catch (err) {
    return res.status(500).json({ error: err.message });
  }
});
