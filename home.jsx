import React, { useState, useEffect } from 'react';

const BACKEND_URL = 'https://play-for-win.onrender.com';

const Home = ({ user, onPlayAd, refreshUserData }) => {
  const [gameState, setGameState] = useState('idle'); // idle, playing, ended
  const [score, setScore] = useState(0);
  const [timeLeft, setTimeLeft] = useState(30);
  const [targetPos, setTargetPos] = useState({ top: '50%', left: '50%' });
  const [cooldown, setCooldown] = useState(0);
  const [isClaiming, setIsClaiming] = useState(false);

  // টার্গেট র‍্যান্ডম পজিশনে সরানো
  const moveTarget = () => {
    const top = Math.floor(Math.random() * 70) + 15 + '%';
    const left = Math.floor(Math.random() * 70) + 15 + '%';
    setTargetPos({ top, left });
  };

  // গেম স্টার্ট করা (সম্পূর্ণ অ্যাড দেখার পর)
  const handleStartGame = async () => {
    if (cooldown > 0) return;

    // App.jsx থেকে আসা অ্যাড কল ফাংশন
    const adWatched = await onPlayAd();
    if (adWatched) {
      setScore(0);
      setTimeLeft(30);
      setGameState('playing');
      moveTarget();
    }
  };

  // ৩০ সেকেন্ড কাউন্টডাউন টাইমার
  useEffect(() => {
    let timer;
    if (gameState === 'playing' && timeLeft > 0) {
      timer = setInterval(() => setTimeLeft((prev) => prev - 1), 1000);
    } else if (timeLeft === 0 && gameState === 'playing') {
      setGameState('ended');
      setCooldown(30); // গেম শেষে ৩০ সেকেন্ড কুলডাউন/রিচার্জ
    }
    return () => clearInterval(timer);
  }, [gameState, timeLeft]);

  // কুলডাউন টাইমার
  useEffect(() => {
    let cdTimer;
    if (cooldown > 0) {
      cdTimer = setInterval(() => setCooldown((prev) => prev - 1), 1000);
    }
    return () => clearInterval(cdTimer);
  }, [cooldown]);

  // শুট বা ট্যাপ করা
  const handleShoot = () => {
    if (gameState !== 'playing') return;
    setScore((prev) => prev + 10);
    moveTarget();
  };

  // পয়েন্ট সেভ বা ডাবল করার ক্লেইম লজিক
  const claimReward = async (isDouble = false) => {
    if (score === 0) {
      setGameState('idle');
      return;
    }
    setIsClaiming(true);

    const sendScoreToBackend = async (finalScore) => {
      try {
        const response = await fetch(`${BACKEND_URL}/api/game/reward`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            telegramId: user?.telegramId,
            coins: finalScore
          }),
        });

        if (response.ok) {
          alert(`🎉 Successfully claimed ${finalScore} Coins!`);
          refreshUserData();
          setGameState('idle');
          setScore(0);
        } else {
          alert("Error claiming coins. Please try again.");
        }
      } catch (err) {
        console.error(err);
      } finally {
        setIsClaiming(false);
      }
    };

    if (isDouble) {
      const adWatched = await onPlayAd();
      if (adWatched) {
        await sendScoreToBackend(score * 2);
      } else {
        setIsClaiming(false);
      }
    } else {
      await sendScoreToBackend(score);
    }
  };

  return (
    <div className="p-4 text-center min-h-[80vh] flex flex-col justify-between">
      
      {/* 1. IDLE STATE (স্টার্ট হোম স্ক্রিন) */}
      {gameState === 'idle' && (
        <div className="mt-8 flex flex-col items-center">
          <div className="w-24 h-24 bg-amber-500/10 rounded-full flex items-center justify-center border-2 border-amber-500/30 mb-4">
            <span className="text-5xl">🎯</span>
          </div>

          <h2 className="text-2xl font-bold text-amber-400 mb-2">Target Shooter Game</h2>
          <p className="text-gray-400 text-sm mb-1">Shoot as many targets as you can in 30 seconds!</p>
          <p className="text-xs text-amber-300 bg-amber-950/40 px-3 py-1 rounded-full border border-amber-500/20 mb-6">
            ✨ 1 Target Hit = +10 Coins
          </p>

          <button
            onClick={handleStartGame}
            disabled={cooldown > 0}
            className={`w-full max-w-xs py-4 px-6 rounded-2xl font-black text-lg transition-all transform active:scale-95 shadow-lg ${
              cooldown > 0 
                ? 'bg-gray-800 text-gray-500 border border-gray-700 cursor-not-allowed' 
                : 'bg-gradient-to-r from-amber-500 to-yellow-400 text-gray-950 shadow-amber-500/20'
            }`}
          >
            {cooldown > 0 ? `Recharge in ${cooldown}s` : '🎯 PLAY GAME'}
          </button>
        </div>
      )}

      {/* 2. PLAYING STATE (শুটিং ম্যাচ ক্যানভাস) */}
      {gameState === 'playing' && (
        <div className="w-full">
          <div className="flex justify-between items-center bg-gray-900/80 px-4 py-3 rounded-xl border border-gray-800 mb-4 font-bold text-lg">
            <span className="text-amber-400">⏱️ {timeLeft}s</span>
            <span className="text-emerald-400">🪙 {score}</span>
          </div>

          <div className="h-[360px] w-full bg-gray-900/50 border-2 border-dashed border-gray-800 rounded-2xl relative overflow-hidden">
            <button
              onClick={handleShoot}
              style={{
                top: targetPos.top,
                left: targetPos.left,
                transform: 'translate(-50%, -50%)',
              }}
              className="absolute w-16 h-16 rounded-full bg-red-600 border-4 border-white shadow-lg active:scale-90 transition-transform flex items-center justify-center text-2xl select-none"
            >
              🎯
            </button>
          </div>
        </div>
      )}

      {/* 3. GAME OVER SCREEN (স্কোর ক্লেইম স্ক্রিন) */}
      {gameState === 'ended' && (
        <div className="bg-gray-900 border border-gray-800 p-6 rounded-2xl mt-6">
          <h3 className="text-xl font-bold text-white mb-2">🎉 Game Over!</h3>
          <p className="text-gray-400 text-sm mb-1">Your Match Score:</p>
          <p className="text-3xl font-black text-amber-400 mb-6">{score} Coins</p>

          <div className="flex flex-col gap-3">
            <button
              onClick={() => claimReward(false)}
              disabled={isClaiming}
              className="w-full py-3 bg-gray-800 hover:bg-gray-700 text-white font-bold rounded-xl border border-gray-700"
            >
              Claim {score} Coins
            </button>

            <button
              onClick={() => claimReward(true)}
              disabled={isClaiming}
              className="w-full py-3 bg-gradient-to-r from-emerald-600 to-green-500 text-white font-bold rounded-xl shadow-lg shadow-emerald-950"
            >
              🎬 Watch Ad to Double (2x) → {score * 2} Coins
            </button>
          </div>
        </div>
      )}

    </div>
  );
};

export default Home;
