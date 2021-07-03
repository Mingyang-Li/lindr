import React from 'react';
import TinderCard from 'react-tinder-card';

const Swipe: React.FC = () => {
    const onSwipe = (direction:any) => {
        console.log('You swiped: ' + direction)
      }
      
    const onCardLeftScreen = (myIdentifier: any) => {
        console.log(myIdentifier + ' left the screen')
    }
    return (
        <>
            <h1>Swipe page</h1>
            <TinderCard onSwipe={onSwipe} onCardLeftScreen={() => onCardLeftScreen('fooBar')} preventSwipe={['right', 'left']}>Hello, World!</TinderCard>
        </>
    )
};

export default Swipe;
