package board.dao.face;

import java.util.List;

import board.dto.FreeBoard;

public interface BoardDao {

	public List<FreeBoard> selectFreeAll();

}
