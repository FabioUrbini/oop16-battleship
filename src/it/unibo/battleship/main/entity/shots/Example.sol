pragma solidity ^0.4.0;

contract Counter {
    event Increased ( uint oldValue , address cause );
    address owner ;
    uint value ;

    function Counter () public { owner = msg . sender ; } // <-- constructor

    function inc ( uint times ) public { // <-- API
        for ( uint i = 0; i < times ; i ++) {
            emit Increased ( value ++, msg. sender );
        }
    }

    function kill () public { // <-- API
        require (msg . sender == owner );
        selfdestruct( owner );
    }

    function () { // <-- fallback
        throw ;
    }
}
