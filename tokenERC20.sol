// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <=0.9.0;

interface IERC20 {
    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    function decimals() external view returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address _owner) external view returns (uint256 balance);

    function transfer(
        address _to,
        uint256 _value
    ) external returns (bool success);

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external returns (bool success);

    function approve(
        address _spender,
        uint256 _value
    ) external returns (bool success);

    function allowance(
        address _owner,
        address _spender
    ) external view returns (uint256 remaining);
}

abstract contract ERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;
    mapping(address => uint256) _balanceOf; // _balanceOf[address] => uint256
    mapping(address => mapping(address => uint256)) _allowance; // _allownce[address][address] => uint256
    string public contrato;

    constructor(
        string memory __name,
        string memory __symbol,
        uint8 __decimals,
        uint256 __totalSupply
    ) {
        _name = __name;
        _symbol = __symbol;
        _decimals = __decimals;
        _totalSupply = __totalSupply;
        _balanceOf[msg.sender] = __totalSupply;
    }

    function name() external view returns (string memory) {
        return (_name);
    }

    function symbol() external view returns (string memory) {
        return (_symbol);
    }

    function decimals() external view returns (uint8) {
        return (_decimals);
    }

    function totalSupply() external view returns (uint256) {
        return (_totalSupply);
    }

    function balanceOf(address _owner) external view returns (uint256 balance) {
        return (_balanceOf[_owner]);
    }

    function allowance(
        address _owner,
        address _spender
    ) external view returns (uint256 remaining) {
        return (_allowance[_owner][_spender]);
    }

    function transfer(
        address _to,
        uint256 _value
    ) external returns (bool success) {
        _balanceOf[msg.sender] -= _value;
        _balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return (true);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external returns (bool success) {
        require(
            _allowance[_from][msg.sender] >= _value,
            "You do not have that value available"
        );
        _allowance[_from][msg.sender] -= _value;
        _balanceOf[_from] -= _value;
        _balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        return (true);
    }

    function approve(
        address _spender,
        uint256 _value
    ) external returns (bool success) {
        _allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return (true);
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
}
